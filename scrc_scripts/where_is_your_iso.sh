#!/bin/bash

echo Where is your iso?

read path_to_iso

# will need to update volume path for other users; alt, could make that a variable as well
docker run -v /Users/"$(whoami)"/archives/working/born_digital/to-process:/Users/"$(whoami)"/archives/working/born_digital/to-process:ro --rm focal:bdap 
/bin/bash -c "disktype $path_to_iso"
