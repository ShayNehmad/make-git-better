echo "Setting up stage 10..."

cd .git/hooks
ln -s -f ../../githooks/pre-commit pre-commit
cd ..

echo "Done."
