# TqExtension (Lviv Drupal camp 2015)

## Dependencies

- [Vagrant](https://www.vagrantup.com/downloads.html)
  - [Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)
- [Ansible](https://github.com/ansible/ansible)

## Installation

```shell
git clone git@github.com:BR0kEN-/lviv-tqextension.git
cd lviv-tqextension
vagrant up
./scripts/ansible.sh reinstall
```

## Usage

### Sniffers

```shell
./scripts/ansible.sh sniffers
```

### Tests

```shell
./scripts/ansible.sh tests [--tags="@tag1&&~@tag2"] [--format="html"] [--kill-selenium]
```

If `--kill-selenium` won't be specified, then only Behat will run (until Selenium process alive).
