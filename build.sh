echo "assembling code"
lwasm --6809 main.asm --list=main.list --output=3dmnstr.bin
echo "copying file to disk image"
cp blank.dsk main.dsk
writecocofile   -b main.dsk 3dmnstr.bin  
cp main.dsk ../../mame64/

lwasm --6809 mainccc.asm --format=raw --list=mainccc.list --output=3dmnstr.ccc
#./pad 3dmnstr.ccc 16
cp 3dmnstr.ccc ../../mame64

