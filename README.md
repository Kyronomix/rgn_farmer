# rgn_farmer by Kyro - Based on poke_miner_job
 Farming job with many customization options in config.lua that goes in depth by providing a
 corn item to the player and paying them based on a random amount of corn they get from each harvest point.

## 1. Requirements
- [ProgressBar](https://github.com/PokeSerGG/RedM-ProgressBar)
- [VORPCore] (https://github.com/VORPCORE/VORP-Core/tree/master/build)
- [VORPInventory] (https://github.com/VORPCORE/VORP-Inventory/releases/tag/JohnMarston)

- Change the name of the job in Config.lua and your user in the database
- Add ```ensure rgn_farmer``` in your server.cfg with the Requirements above it.
- Add the corn item into your items database -- INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('corn', 'corn', '12', '1', 'item_standard', '0')
- Add the corn.png to the vorp_inventory\html\img\items folder.
- Enjoy!
