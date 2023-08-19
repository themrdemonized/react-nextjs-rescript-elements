const bsconfig = require('./bsconfig.json');
const fs = require("fs");

const transpileModules = ["rescript"].concat(bsconfig["bs-dependencies"]);
const withTM = require("next-transpile-modules")(transpileModules);

const isWebpack5 = true;
const config = {
  output: "standalone",
  pageExtensions: ["jsx", "js"],
  env: {
    ENV: process.env.NODE_ENV,
  },
  webpack: (config, options) => {
    const { isServer } = options;

    if (isWebpack5) {
      if (!isServer) {
        // We shim fs for things like the blog slugs component
        // where we need fs access in the server-side part
        config.resolve.fallback = {
          fs: false,
          path: false,
        };
      }

      // We need this additional rule to make sure that mjs files are
      // correctly detected within our src/ folder
      config.module.rules.push({
        test: /\.m?js$/,
        // use: options.defaultLoaders.babel,
        exclude: /node_modules/,
        type: "javascript/auto",
        resolve: {
          fullySpecified: false,
        }
      });

      // Sass
      // config.module.rules.push({
      //   test: /\.s[ac]ss$/i,
      //   use: [
      //     'style-loader', // creates style nodes from JS strings
      //     {
      //       loader: 'css-loader', // translates CSS into CommonJS
      //       options: {
      //         importLoaders: 1
      //       }
      //     },
      //     'postcss-loader', // post process the compiled CSS
      //     'sass-loader' // compiles Sass to CSS, using Node Sass by default
      //   ],
      // })
    }
    return config
  },
};

module.exports = withTM(config);
