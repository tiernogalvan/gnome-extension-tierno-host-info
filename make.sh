#!/bin/bash

package='tierno-host-info.zip'

if [[ -f ${package} ]] ; then rm ${package} ; fi
zip -9 ${package} extension.js utils.js.js metadata.json *.md LICENSE

