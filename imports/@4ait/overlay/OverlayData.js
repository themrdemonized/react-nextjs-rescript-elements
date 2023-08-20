import {reactive} from 'vue';

export default class OverlayProvider
{
    $data = reactive({
        teleportTo: "body",

        startZIndex: 1,
        endZIndex: 9999999,
        nextZIndex: 1
    });

    set teleportTo(teleportTo)
    {
        this.$data.teleportTo = teleportTo;
    }

    get teleportTo()
    {
        return this.$data.teleportTo;
    }

    set startZIndex(zIndex)
    {
        this.$data.startZIndex = zIndex;

        if(this.$data.startZIndex > this.$data.nextZIndex)
        {
            this.$data.nextZIndex = this.$data.startZIndex;
        }
    }

    set endZIndex(zIndex)
    {
        this.$data.endZIndex = zIndex;

        if(this.$data.endZIndex < this._nextZIndex)
        {
            this._nextZIndex = this.$data.endZIndex;
        }
    }

    requestZIndex()
    {
        const nextZIndex = this.$data.nextZIndex;

        this.$data.nextZIndex++;
        if(this.$data.nextZIndex > this.$data.endZIndex)
        {
            this.$data.nextZIndex = this.$data.startZIndex;
        }

        return nextZIndex;
    }
}
