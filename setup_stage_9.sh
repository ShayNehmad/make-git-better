echo "Setting up stage 9..."

cd .git/hooks
ln -s -f ../../githooks/pre-commit pre-commit
ls -la
cd ..

echo "Done."
