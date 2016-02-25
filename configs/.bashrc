# Custom configurations
export TOOLS=~/tools
export DEV=~/development

set -o vi

if [ -d "$TOOLS/processing/processing-3.0.2" ]; then
  export PATH="$PATH:$TOOLS/processing/processing-3.0.2"
fi

