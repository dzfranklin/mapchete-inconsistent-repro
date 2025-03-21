FROM ghcr.io/osgeo/gdal:ubuntu-small-3.10.2

RUN apt update && apt install -y --no-install-recommends python3-pip python3-dev build-essential libgeos-dev git \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*.

RUN pip install --break-system-packages \
    'mapchete[serve]==2025.1.1' rtree \
    --no-binary rasterio --no-binary fiona --no-binary shapely

RUN mkdir /out

WORKDIR /app
COPY . .

ENTRYPOINT ["mapchete", "serve", "repro.mapchete"]
