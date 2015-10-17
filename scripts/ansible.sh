#!/usr/bin/env bash

cd $(realpath ${0%/*})

# If task name is not specified or if we requested it then we show tasks list.
if [[ -z ${1} || ${1} == "--tasks" ]]; then
    echo "Available tasks:"
    for task in $(ls -A *.yml); do
        task=${task#sudo-}
        echo "- ${task%%.*}"
    done
    exit 0
fi

script_name="${1}.yml"
sudo_script_name="sudo-${script_name}"
params=""

if [ -f ${sudo_script_name} ]; then
    params+=" --ask-sudo-pass"
    script_name=${sudo_script_name}
fi

extra_vars=""

for ((i = 2; i <= $#; i++)); do
    # Remove all data after "=" symbol.
    var=${!i%=*}
    val=${!i#*=}

    if [ "${var}" == "${val}" ]; then
        val="True"
    fi

    # Remove leading "--" from argument name.
    var=${var#--}
    # Replace all "-" by "_" in argument name.
    var=${var//-/_}

    if [ ${var} == "limit" ]; then
        params+=" --${var}=${val}"
        continue
    fi

    if [[ ${val} != {* && ${val: -1} != "}" ]]; then
        val="\"${val}\""
    fi

    extra_vars+="\"${var}\":${val},"
done

# Remove last comma.
extra_vars=${extra_vars%%,}

if [ -n "${extra_vars}" ]; then
    params+=" --extra-vars='{${extra_vars}}'"
fi

eval "time ansible-playbook -vvvv ${script_name} -i inventory ${params}"
