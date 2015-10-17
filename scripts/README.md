## Use --limit to be able to run playbook for concrete hosts

```shell
./scripts/ansible.sh sniffers --limit=local
```

## Pass any variables to playbook as script arguments

```shell
./scripts/ansible.sh reinstall --mysql='{"default": {"name": "drupal", "user": "root"}}'
```

Variable `mysql` will be available in a playbook as a dict (f.e.: `mysql.default.user`).

## Sudo

If you want to ask for `sudo` pass then prefix name of playbook with `sudo-`. 
