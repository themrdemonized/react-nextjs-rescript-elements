

export default class TimeoutResetter
{
    constructor(callback, timeout)
    {
        this.callback = callback;
        this.timeout = timeout;
        this.canceled = false;

        this._timeoutFunc = this._timeoutFunc.bind(this);
    }

    setTimeout(timeout)
    {
        if(this.timeout !== timeout)
        {
            this.cancelImmediately();
            this.timeout = timeout;
        }
    }

    _timeoutFunc()
    {
        if(this.canceled)
        {
            this.requiredTimeMs = null;
            this.timerId = null;
            this.canceled = false;
            return;
        }

        if(this.requiredTimeMs)
        {
            const currentTime = new Date().getTime();

            clearTimeout(this.timerId);
            this.timerId = setTimeout(this._timeoutFunc, this.requiredTimeMs - currentTime);
            this.requiredTimeMs = null;
            return;
        }

        this.timerId = null;
        this.callback();
    }

    run()
    {
        if(this.timerId)
        {
            this.canceled = false;

            const currentTime = new Date().getTime();
            this.requiredTimeMs = currentTime + this.timeout;
            return;
        }

        this.timerId = setTimeout(this._timeoutFunc, this.timeout);
    }

    cancel()
    {
        if(this.timerId)
        {
            this.canceled = true;
        }
    }

    cancelImmediately()
    {
        if(this.timerId)
        {
            clearTimeout(this.timerId);
            this.requiredTimeMs = null;
            this.timerId = null;
            this.canceled = false;
        }
    }
}