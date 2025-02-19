import GLib from 'gi://GLib';
import GObject from 'gi://GObject';
import Clutter from 'gi://Clutter';
import St from 'gi://St';

// From https://gitlab.com/blackredstarts/system-software-info
import {Extension, gettext as _} from 'resource:///org/gnome/shell/extensions/extension.js';
import * as PanelMenu from 'resource:///org/gnome/shell/ui/panelMenu.js';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';

import * as Utils from './utils.js';

const Indicator = GObject.registerClass(
    class Indicator extends PanelMenu.Button {    
        constructor() {
            super(0.0, _('Host Info'));            
            this._label = new St.Label({
                y_align: Clutter.ActorAlign.CENTER,         
                text: "Loading...",
                style_class: 'panel-button', 
                track_hover: false
            });
            this.add_child(this._label);            
            this._label.text = this._get_label();
        }
        
        _get_label() {    
            const ip = Utils.getLanIp();
            const hostname = Utils.getHostname();
            const username = Utils.getUsername();
            return `${username}@${hostname} ${ip}`;
        }
        
    }
);

export default class TiernoHostInfoExtension extends Extension {
    _indicator;
    
    enable() {
        this._indicator = null;
        this._run_timer();
    }

    _run_timer() {
        const priority = 0; // G_PRIORITY_DEFAULT
        const refreshTime = 5; // in seconds

        if (this._timeout) {
            GLib.source_remove(this._timeout);
            this._timeout = undefined;
        }
        this._timeout = GLib.timeout_add_seconds(priority, refreshTime, () => { this._run_timer() });
        this._update_indicator();
    }
    
    _update_indicator() {
        if (this._indicator != null) {
            this._indicator.destroy();          
            this._indicator = null;
        }        
        this._indicator = new Indicator();
        const box_position = 'left';  // left, center, right
        const offset = 2;
        Main.panel.addToStatusArea(this.uuid, this._indicator, offset, box_position);
    }
    
    disable() {
        if (this._timeout) {
            GLib.source_remove(this._timeout);
        }
        this._timeout = undefined;
        this._indicator.destroy();
        this._indicator = null;
    }
}
