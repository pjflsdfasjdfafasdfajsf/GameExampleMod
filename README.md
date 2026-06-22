Example Mod showing the example usage of the modding SDK.

To build you must have the Game already cloned somewhere as you need the SDK headers.
Let's say you have them at `~/Game/Code/Public`:
```sh
git clone https://github.com/pjflsdfasjdfafasdfajsf/GameExampleMod
cd GameExampleMod

chmod +x ./Build.sh
./Build.sh ~/Game/Code/Public
```
The compiled `.wasm` will be available in Build directory.
