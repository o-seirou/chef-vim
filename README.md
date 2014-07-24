vim Cookbook
============
This cookbook install vim latest.

Platforms
------------
This cookbook test only Ubuntu 14.04.
This cookbook does not work on redhat/centos.

Attributes
----------
None.

Usage
-----
Just include `vim` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[vim]"
  ]
}
```

License and Authors
-------------------
MIT.
