import GLib from 'gi://GLib';

// This method is from https://github.com/Josholith/gnome-extension-lan-ip-address
export const getLanIp = () => {       
    // Ask the IP stack what route would be used to reach 1.1.1.1 (Cloudflare DNS)
    // Specifically, what src would be used for the 1st hop?
    const command_output_bytes = GLib.spawn_command_line_sync('ip route get 1.1.1.1')[1];
    const command_output_string = String.fromCharCode.apply(null,  command_output_bytes);

    // Output of the "ip route" command will be a string
    // " ... src 1.2.3.4 ..."
    // So basically we want the next token (word) immediately after the "src"
    // word, and nothing else. This is considerd our LAN IP address.
    const Re = new RegExp(/src [^ ]+/g);
    const matches = command_output_string.match(Re);
    if (matches) {
        return matches[0].split(' ')[1];
    } else {
        return '';
    }
}

export const getHostname = () => {       
    const command_output_bytes = GLib.spawn_command_line_sync('hostname')[1];
    const command_output_string = String.fromCharCode.apply(null,  command_output_bytes);
    return command_output_string.trim();
}

export const getUsername = () => {       
    const command_output_bytes = GLib.spawn_command_line_sync('logname')[1];
    const command_output_string = String.fromCharCode.apply(null,  command_output_bytes);
    return command_output_string.trim();
}

