import mapchete.processes.hillshade


def execute(mp, resampling):
    with mp.open("dem") as src:
        if src.is_empty(1):
            return "empty"
        else:
            dem = src.read(1, resampling=resampling)

    return mapchete.processes.hillshade.hillshade(dem, mp.tile.affine)
