# ns8-guacamole

Apache Guacamole is a web remote desktop gateway.

After installation and configuring a FQDN you can login with user `guacadmin` and password `guacadmin`

## Install

Install via Software center:

  - Add a Software repository pointing to `https://repo.mrmarkuz.com/ns8/updates/`
  - Install Guacamole via Software Center

Instantiate the module with:

    add-module ghcr.io/mrmarkuz/guacamole:1.0.0-beta.2

To get the latest (testing) version:

    add-module ghcr.io/mrmarkuz/guacamole:latest

The output of the command will return the instance name.
Output example:

    {"module_id": "guacamole1", "image_name": "guacamole", "image_url": "ghcr.io/mrmarkuzguacamole:1.0.0-beta.2"}

## LDAP configuration

In the app settings, an LDAP or Samba AD can be chosen for being used for authentication.

You may login as guacadmin and create a group. Name it "domain admins" when using LDAP or "Domain Admins" (case sensitive!) when using Samba AD.
Give the group full admin permissions.
This way the Nethserver domain admins can login to Guacamole and are able to manage users/groups.

## TOTP authentication

Add "TOTP_ENABLED=true" to the `environment` file:

    runagent -m guacamole1 bash -c "grep -q TOTP_ENABLED environment || echo TOTP_ENABLED=true >> environment

...and restart the service:

    runagent -m guacamole1 systemctl --user restart guacamole

## Branding

The branding.jar file can be found in `/home/guacamole1/.config/branding/branding.jar`.
See https://github.com/Zer0CoolX/guacamole-customize-loginscreen-extension for more information about customizing.

After editing the file, Guacamole needs to be restarted:

    runagent -m guacamole1 systemctl --user restart guacamole

## More extensions

More extensions and environment variables can be found here:

https://guacamole.apache.org/doc/gug/guacamole-docker.html#the-guacamole-docker-image

## Crowdsec

Guacamole is secured by crowdsec by default.

## Uninstall

To uninstall the instance via CLI:

    remove-module --no-preserve guacamole1
