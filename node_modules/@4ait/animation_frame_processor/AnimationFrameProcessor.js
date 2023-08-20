

let globalId = Number.MIN_SAFE_INTEGER;
let globalIdStylesGet = Number.MIN_SAFE_INTEGER;

let animationFrameId = null;

const processCallbacksDict = new Map();
const processCallbacksStylesGetDict = new Map();

function processorCallbacks() {
    animationFrameId = null;

    let callbacks = Array.from(processCallbacksStylesGetDict.values());
    processCallbacksStylesGetDict.clear();
    for(const callback of callbacks)
    {
        callback();
    }

    callbacks = Array.from(processCallbacksDict.values());
    processCallbacksDict.clear();
    for(const callback of callbacks)
    {
        callback();
    }
}

export default class AnimationFrameProcessor
{
    static request(callback)
    {
        if(animationFrameId === null)
        {
            animationFrameId = requestAnimationFrame(processorCallbacks);
        }

        const id = globalId++;

        processCallbacksDict.set(id, callback);

        return id;
    }

    static requestStylesGet(callback)
    {
        if(animationFrameId === null)
        {
            animationFrameId = requestAnimationFrame(processorCallbacks);
        }

        const id = globalIdStylesGet++;

        processCallbacksStylesGetDict.set(id, callback);

        return id;
    }

    static cancel(id)
    {
        processCallbacksDict.delete(id);
    }

    static cancelStylesGet(id)
    {
        processCallbacksStylesGetDict.delete(id);
    }
}
