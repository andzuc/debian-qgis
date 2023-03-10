#!/bin/bash
export LIBGL_ALWAYS_INDIRECT=1
export LIBGL_ALWAYS_SOFTWARE=0
export MESA_GL_VERSION_OVERRIDE=3.0
PROFILEDIR="${HOME}/dev/qgis"

if [ -d "${PROFILEDIR}" ] ; then
    docker run -it \
	   --name qgis \
	   --rm \
	   --net=host \
	   --env="DISPLAY" \
	   --env="LIBGL_ALWAYS_INDIRECT" \
	   --env="LIBGL_ALWAYS_SOFTWARE" \
	   --env="MESA_GL_VERSION_OVERRIDE" \
	   --mount "type=bind,src=${HOME}/.Xauthority,dst=/home/qgis/.Xauthority,readonly" \
	   --mount "type=bind,src=${PROFILEDIR},dst=/home/qgis" \
	   --entrypoint /bin/bash \
	   andzuc/debian-qgis:latest
else
    echo "Profile not found: ${PROFILE}"
fi
