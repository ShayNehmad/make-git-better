echo "Setting up stage 10..."

cd .git/hooks
ln -s -f ../../githooks/commit-msg commit-msg
cd ..

echo "Done."
