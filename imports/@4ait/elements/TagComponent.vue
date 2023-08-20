<style module lang="scss">
    @import '~@4ait/scss_fonts_expansion/fonts_declare';

    /*
        --4ait-elements--tag--color: var(--trade-style-palette_light_fill_quaternary);
        --4ait-elements--tag--hover-color: var(--trade-style-palette_light_fill_primary);
        --4ait-elements--tag--active-color: var(--trade-style-palette_tint_green_40);

        --4ait-elements--tag--error-color: var(--trade-style-palette_tint_red_90-opaque);
        --4ait-elements--tag--error-hover-color: var(--trade-style-palette_tint_red_80-opaque);
        --4ait-elements--tag--error-active-color: var(--trade-style-palette_tint_red_50);

        --4ait-elements--tag--border-color: var(--trade-style-palette_light_fill_secondary);
        --4ait-elements--tag--hover-border-color: var(--trade-style-palette_light_fill_secondary);
        --4ait-elements--tag--active-border-color: var(--trade-style-palette_light_fill_secondary);

        --4ait-elements--tag--error-border-color: var(--trade-style-palette_tint_red_80-opaque);
        --4ait-elements--tag--error-hover-border-color: var(--trade-style-palette_tint_red_50);
        --4ait-elements--tag--error-active-border-color: var(--trade-style-palette_tint_red_50);

        --4ait-elements--tag--text-color: var(--trade-style-palette_light_label_primary);
        --4ait-elements--tag--error-text-color: var(--trade-style-palette_tint_red_50);
        --4ait-elements--tag--active-text-color: var(--trade-style-palette_dark_label_primary);

        --4ait-elements--tag--icon-color: var(--trade-style-palette_light_label_secondary);
        --4ait-elements--tag--icon-hover-color: var(--trade-style-palette_light_label_primary);
        --4ait-elements--tag--icon-active-color: var(--trade-style-palette_dark_label_primary);
        --4ait-elements--tag--icon-on-hover-color: var(--trade-style-palette_light_label_secondary);
        --4ait-elements--tag--icon-active-on-hover-color: var(--trade-style-palette_dark_label_secondary);

        --4ait-elements--tag--icon-error-color: var(--trade-style-palette_tint_red_50);
        --4ait-elements--tag--icon-error-hover-color: var(--trade-style-palette_tint_red_50);
        --4ait-elements--tag--icon-error-active-color: var(--trade-style-palette_dark_label_primary);
        --4ait-elements--tag--icon-error-on-hover-color: var(--trade-style-palette_tint_red_40);
        --4ait-elements--tag--icon-error-active-on-hover-color: var(--trade-style-palette_dark_label_secondary);

        --4ait-elements--tag--xmark-color: var(--trade-style-palette_light_label_quarternary);
        --4ait-elements--tag--xmark-hover-color: var(--trade-style-palette_light_label_secondary);
        --4ait-elements--tag--xmark-active-color: var(--trade-style-palette_dark_label_primary);
        --4ait-elements--tag--xmark-on-hover-color: var(--trade-style-palette_light_label_primary);
        --4ait-elements--tag--xmark-active-on-hover-color: var(--trade-style-palette_dark_label_secondary);

        --4ait-elements--tag--xmark-error-color: var(--trade-style-palette_tint_red_80-opaque);
        --4ait-elements--tag--xmark-error-hover-color: var(--trade-style-palette_tint_red_50);
        --4ait-elements--tag--xmark-error-active-color: var(--trade-style-palette_dark_label_primary);
        --4ait-elements--tag--xmark-error-on-hover-color: var(--trade-style-palette_tint_red_40);
        --4ait-elements--tag--xmark-error-active-on-hover-color: var(--trade-style-palette_dark_label_secondary);

        @include setFontFromAnotherFont(font-4ait-elements, caption-def, trade-font, m-navigation);
    */

    //Default elements of tag
    //Background object
    .tag
    {
      position: relative;
      display: flex;
      align-items: center;

      width: 100%;
      height: 24px;

      border: 0.5px solid;
      border-radius: 4px;

      box-sizing: border-box;

      transition: all ease 0.2s;

      //padding: 1px;
    }

    //Text of the tag
    .caption
    {
      flex: 1;

      margin-left: 7px;
      margin-right: 7px;

      min-width: 1px;

      text-overflow: ellipsis;

      @include setFont(font-4ait-elements, caption-def);
    }

    //Xmark to delete tag
    .xmark {
        cursor: pointer;

        width: 16px;
        height: 16px;

        margin-left: -5px;
        margin-right: 1px;
    }

    //Icon to show information about this tag
    .icon {
        width: 16px;
        height: 16px;

        margin-left: 5px;
        margin-right: -6px;
    }

    //States:
    //Default - when nothing happening - all elements has it's default properties
    .default 
    {
        display: inline-block;

        .tag 
        {
            border: 0.5px solid var(--4ait-elements--tag--border-color);
            background: var(--4ait-elements--tag--color);
        }

        .caption 
        {
            color: var(--4ait-elements--tag--text-color);
        }

        .xmark 
        {
            color: var(--4ait-elements--tag--xmark-color);

            &:hover 
            {
                color: var(--4ait-elements--tag--xmark-on-hover-color);
            }
        }

        .icon 
        {
            color: var(--4ait-elements--tag--icon-color);

            &:not(.non-hoverable):hover 
            {
                color: var(--4ait-elements--tag--icon-on-hover-color);
            }
        }

        //On hover change colors of tag, xmark and icon
        //Available hover only for non-active buttons
        &:not(.active):not(.non-hoverable):hover
        {
            .tag
            {
                border: 0.5px solid var(--4ait-elements--tag--hover-border-color);
                background: var(--4ait-elements--tag--hover-color);
            }

            .xmark 
            {
                color: var(--4ait-elements--tag--xmark-hover-color);

                &:hover 
                {
                    color: var(--4ait-elements--tag--xmark-on-hover-color);
                }
            }

            .icon 
            {
                color: var(--4ait-elements--tag--icon-hover-color);

                &:not(.non-hoverable):hover 
                {
                    color: var(--4ait-elements--tag--icon-on-hover-color);
                }
            }
        }
    }

    //Same for error state
    .error
    {
        .tag
        {
            border: 0.5px solid var(--4ait-elements--tag--error-border-color);
            background: var(--4ait-elements--tag--error-color);
        }

        .caption 
        {
            color: var(--4ait-elements--tag--error-text-color);
        }

        .xmark 
        {
            color: var(--4ait-elements--tag--xmark-error-color);

            &:hover 
            {
                color: var(--4ait-elements--tag--xmark-error-on-hover-color);
            }
        }

        .icon 
        {
            color: var(--4ait-elements--tag--icon-error-color);
            
            &:not(.non-hoverable):hover 
            {
                color: var(--4ait-elements--tag--icon-error-on-hover-color);
            }
        }

        //Available hover only for non-active buttons
        &:not(.error-active):not(.non-hoverable):hover
        {
            .tag
            {
                border: 0.5px solid var(--4ait-elements--tag--error-hover-border-color);
                background: var(--4ait-elements--tag--error-hover-color);
            }

            .xmark 
            {
                color: var(--4ait-elements--tag--xmark-error-hover-color);
            
                &:hover 
                {
                    color: var(--4ait-elements--tag--xmark-error-on-hover-color);
                }
            }

            .icon 
            {
                color: var(--4ait-elements--tag--icon-error-hover-color);

                &:not(.non-hoverable):hover 
                {
                    color: var(--4ait-elements--tag--icon-error-on-hover-color);
                }
            }
        }
    }

    .active
    {
        .tag
        {
            border: 0.5px solid var(--4ait-elements--tag--active-border-color);
            background: var(--4ait-elements--tag--active-color);
        }
        
        .caption 
        {
            color: var(--4ait-elements--tag--active-text-color);
        }

        .xmark 
        {
            color: var(--4ait-elements--tag--xmark-active-color);
            
            &:hover 
            {
                color: var(--4ait-elements--tag--xmark-active-on-hover-color);
            }
        }

        .icon 
        {
            color: var(--4ait-elements--tag--icon-active-color);

            &:not(.non-hoverable):hover 
            {
                color: var(--4ait-elements--tag--icon-active-on-hover-color);
            }
        }
    }

    .error-active
    {
        .tag
        {
            border: 0.5px solid var(--4ait-elements--tag--error-active-border-color);
            background: var(--4ait-elements--tag--error-active-color);
        }
        
        .caption 
        {
            color: var(--4ait-elements--tag--active-text-color);
        }

        .xmark 
        {
            color: var(--4ait-elements--tag--xmark-error-active-color);
            
            &:hover 
            {
                color: var(--4ait-elements--tag--xmark-error-active-on-hover-color);
            }
        }

        .icon 
        {
            color: var(--4ait-elements--tag--icon-error-active-color);

            &:not(.non-hoverable):hover 
            {
                color: var(--4ait-elements--tag--icon-error-active-on-hover-color);
            }
        }
    }

    //For input
    [contenteditable] 
    {
        outline: 1px solid transparent;
        border: 1px solid transparent;

        min-width: 5pt;
        
        white-space: -moz-pre-wrap;
        white-space: -o-pre-wrap;
        white-space: pre-wrap;
        word-wrap: break-word;

        -webkit-user-select: text;
        user-select: text;
    }

    .cursor-default 
    {
        cursor: default;
    }

    .cursor-pointer 
    {
        cursor: pointer;
    }

    .cursor-text 
    {
        cursor: text;
    }

    .non-selectable 
    {
        -webkit-user-select: none;  
        -moz-user-select: none;    
        -ms-user-select: none;      
        user-select: none;
    }

    .non-hoverable {}

    .iblock 
    {
        display: inline-block;
    }

    .inline 
    {
        display: inline;
    }

    .vertalign 
    {
        vertical-align: middle;
    }

    .text-overflow-ellipsis
    {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

</style>

<template>
    <!-- Outside object - parent container of styles -->
    <div 
            :class="{
                [$style.default]: true,
                [$style.active]: checkBoolean(isActive),
                [$style.error]: checkBoolean(isError),
                [$style['non-hoverable']]: !checkBoolean(isActivable),
                [$style['error-active']]: checkBoolean(isError) && checkBoolean(isActive),
                [$style['cursor-pointer']]: checkBoolean(isActivable),

            }"
    >
        <!-- Main block - container of class 'tag' - background. Has event on click to change state of active -->
        <div :class="{
            [$style.tag]: true,
        }" @click='onClickTag'>
            
            <!-- Icon of icon - left icon on tag -->
            <div
                    v-if="checkBoolean(withIcon)" 
                    :class="{
                        [$style.icon]: true,
                        [$style.iblock]: true,
                        [$style.vertalign]: true,
                        [$style['cursor-pointer']]: checkBoolean(isIconClickable),
                        [$style['non-hoverable']]: !checkBoolean(isIconClickable)
                    }"
                    @click.stop="onClickIcon"
            >
                <slot></slot>
            </div>

            <!-- Draw input when it is active and it's editable -->
            <div 
                    :contenteditable="checkBoolean(isEditable) && checkBoolean(isActive)"
                    :class="{
                        [$style.caption]: true, 
                        [$style.vertalign]: true, 
                        [$style.inline]: true, 
                        [$style['cursor-pointer']]: (!checkBoolean(isEditable) || !checkBoolean(isActive)) && checkBoolean(isActivable),
                        [$style['cursor-text']]: (checkBoolean(isEditable) && checkBoolean(isActive)) && checkBoolean(isTextSelectable),
                        [$style['non-selectable']]: !(checkBoolean(isTextSelectable) || (checkBoolean(isEditable) && checkBoolean(isActive))), //non-selectable when text not (object selectable or it's state is editable and active for edit)
                        [$style['text-overflow-ellipsis']]: checkBoolean(isTextOverflowEllipsis)
                    }"
                    ref="tagInputElement"
                    @click.stop="onClickTagText"
                    @keydown.enter="onTagTextApply"
                    @focusout="onFocusOut"
                    @input="onTagTextInput"
            >
                {{inputValue}}
            </div>

            <!-- Xmark on right side of tag to hide/close it -->
            <div 
                v-if="checkBoolean(withXmark)" 
                :class="{
                    [$style.xmark]: true,
                    [$style.iblock]: true,
                    [$style.vertalign]: true,
                }" 
                @click.stop="onClickXmark" 
            >
                <icon-xmark-small />
            </div>
        </div>
    </div>
</template>

<script>
    import { Options, Vue } from "vue-class-component";

    import IconXmarkSmall from "@4ait/icons_system/icons/IconXmarkSmall"

    @Options({
        components: 
        {
            IconXmarkSmall
        },
        props: 
        {
            modelValue: String,

            modelIsActive: { //is object active
                type: [ String, Boolean ],
                default: false
            },

            modelIsActivable: { //is object has possibility to be active
                type: [ String, Boolean ],
                default: true
            },

            modelOnClickXmark: { //value when clicking close button emits result
                type: [ String, Boolean ],
                default: true
            },

            withIcon: {
                type: [ String, Boolean ],
                default: false
            },

            withXmark: {
                type: [ String, Boolean ],
                default: false
            },
            
            isError: {
                type: [ String, Boolean ],
                default: false
            },

            isEditable: {
                type: [ String, Boolean ],
                default: false
            },

            isIconClickable: {
                type: [ String, Boolean ],
                default: false
            },

            isTextSelectable: {
                type: [ String, Boolean ],
                default: true
            },

            isTextOverflowEllipsis: {
              type: [ String, Boolean ],
              default: false
            }
        },
        mounted: function() 
        {
            this.setActive(this.modelIsActive);
            this.setActivable(this.modelIsActivable);
            this.setValue(this.modelValue);
        },
        emits: ['update:modelOnClickXmark', 'update:modelOnClickIcon', 'update:modelOnUpdateValue', 'update:modelOnChangeActiveState', 'update:modelOnEdit'],
        watch: 
        {
          modelIsActive: function(boolean)
          {
            this.setActive(boolean)
          },

          modelIsActivable: function(boolean)
          {
            this.setActivable(boolean)
          },

          modelValue() {
            this.setValue(this.modelValue);
          }
        },
    })
    export default class TagComponent extends Vue
    {
        isActive = false;
        isActivable = true; //Variable for possibility to be active for tag
        inputValue = "";

        checkBoolean(val)
        {
            return val === true || val === "true";
        }

        setActive(isactive) 
        {
            this.isActive = isactive;
            this.$emit('update:modelOnChangeActiveState', this.isActive);
        }

        setActivable(isactivable) 
        {
            this.isActivable = isactivable;
        }

        setValue(val) 
        {
            this.inputValue = val;
        }

        setValueEvent(val) 
        {
            //Set value for tag and send event for update
            this.setValue(val);
            this.$emit('update:modelOnUpdateValue', this.inputValue);
        }

        setFocus()
        {
            //window.console.log("Focus");
            var element = this.$refs.tagInputElement;
            var isEmpty = (element.innerText.length == 0); //Костыль - нельзя сделать фокус на объект с нулевой длиной строки

            if (isEmpty) { //Заполняем костыль
                element.innerText = " ";
            }

            var selection = window.getSelection();
            var range = document.createRange();

            range.setStart(element, 0); //Поместить каретку в начало строки и выделить до конца
            range.setEnd(element, 1);

            selection.removeAllRanges();
            selection.addRange(range);

            if (isEmpty) { //Возращаем пустую строку
                element.innerText = "";
            }

            setTimeout(function() { //Костыль - не получается дать фокус объекту с помощью представленного кода выше, поэтому даем таймаут и даем фокус вручную
                element.focus();
            }, 0)
        }

        hasNewLine(string) 
        {
            return (string.indexOf('\n') >= 0 || string.indexOf('\r') >= 0);
        }

        replaceNewLine(string, withSpace = false) 
        {
            //Replace all formats of newline (\r or \n) to empty string or space
            let replacement = withSpace ? " " : "";
            return string.replace(/(\r\n|\n|\r)/gm, replacement);
        }

        onTagTextApply(e) 
        {
            //Set value for tag if it's applies on clicking enter on editable element
            this.setValueEvent(e.target.innerText);
            this.setActive(false);
        }

        onTagTextInput(e) {
            //Remove newlines if they appear (on empty string, for example)
            if (this.hasNewLine(e.target.innerText)) {
                e.target.innerText = this.replaceNewLine(e.target.innerText);
            }
            this.$emit('update:modelOnEdit', e.target.innerText);
        }

        onFocusOut()
        {
            if (this.isEditable && this.isActive) {
                this.setActive(!this.isActive);
            }
        }

        onClickTag() 
        {
            //If object is available to change activity state - change state (click on `tag` element)
            if (this.isActivable) {
                this.setActive(!this.isActive);

                //If also editable - set focus to input element
                if (this.isEditable && this.isActive) {
                    this.setFocus()
                }
            }
        }

        onClickTagText() 
        {
            //If object is available to change activity state - change state (click on `tag` element)
            if (this.isActivable) {
                
                //If object editable - if click on tag - doesn't change state of activity if it's active, otherwice - activate and set focus
                if (this.isEditable) {
                    if (!this.isActive) {
                        this.setActive(!this.isActive)
                        this.setFocus();
                    }

                //If not editable - make as default click on tag
                } else {
                    this.setActive(!this.isActive);
                }
            }
        }

        onClickXmark() 
        {
            //When clicking Xmark, emit event of update close button clicking
            this.$emit('update:modelOnClickXmark', true);
        }

        onClickIcon() 
        {
            //If icon is clickable
            if (this.isIconClickable) {
                //When clicking icon, emit event of clicking on icon
                this.$emit('update:modelOnClickIcon', true);

            //Click on tag, otherwice
            } else {
                this.onClickTag();
            }
        }
    }
</script>
