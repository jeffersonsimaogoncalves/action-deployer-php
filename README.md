
# Action - Deployer PHP

### Usage

```
jeffersonsimaogoncalves/action-deployer-php@master
```

### Example

```yaml
- name: Deploy to prod server
  uses: jeffersonsimaogoncalves/action-deployer-php@master
  with:
    args: deploy
   env:
    SSH_PRIVATE_KEY: ${{ secrets.PRIVATE_KEY }}
```

### Definition

* Set your ssh private key in your repository secrets.
* Set the file and command as argument .
* Current Deployer PHP version: `7.1.4`
 
### Demo workflows

* Run the deployment on branch prefixed by `releases/x`.

```yaml
name: Test action Deployer PHP

on:
  push:
    branches:
      - 'releases/*'

jobs:
  build:
    name: Deploy code to prod
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v1
      - name: Deploy
        uses: jeffersonsimaogoncalves/action-deployer-php@master
        with:
          args: deploy
        env:
          SSH_PRIVATE_KEY: ${{ secrets.PRIVATE_KEY }}
```

### About

* This project is based on top of https://github.com/deployphp/deployer


## Credits

This work is based on the [code by Sercan](https://github.com/musps/action-deployer-php).
