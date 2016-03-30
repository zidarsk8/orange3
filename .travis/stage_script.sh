
if [ "$RUN_PYLINT" ]; then
    foldable pip install pylint
    cd $TRAVIS_BUILD_DIR
    cp pylintrc ~/.pylintrc
    .travis/check_pylint_diff
    exit $?
fi

cd "$ORANGE_DIR"
python -c "from Orange.tests import *"
cp "$TRAVIS_BUILD_DIR"/.coveragerc ./  # for covereage and codecov
PYTHONUNBUFFERED=x coverage run --source=Orange -m unittest -v Orange.tests
