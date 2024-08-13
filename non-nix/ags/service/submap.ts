class SubmapService extends Service {
    static {
        Service.register(this,
            { 'submap-changed': ['string'], },
            { 'submap': ['string'],},
        );
    }

    #submap = "";

    constructor() {
        super()
        const submap = "/tmp/hypr_submap"
        Utils.monitorFile(submap, (file, event) => {
            var data = ""
            data = Utils.readFile(file)
            this.#onChange(data);
        })

        // Initialize.
        var data = ""
        data = Utils.readFile(submap)
        this.#onChange(data);
    }

    get submap() { return this.#submap}
    #onChange(submap) {
        if (submap === this.#submap) {
            return;
        }

        this.#submap = submap
        this.changed('submap');
        this.emit('submap-changed', this.#submap);
    }

}

const service = new SubmapService;
export default service;
