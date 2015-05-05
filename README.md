rsc_ros Cookbook [![Build Status](https://travis-ci.org/RightScale-Services-Cookbooks/rsc_ros.svg?branch=master)](https://travis-ci.org/RightScale-Services-Cookbooks/rsc_ros)
================
Download from various cloud remote object stores.


Requirements
------------
This cookbook primarily depends on the [fog](http://fog.io) library. This cookbook will install fog and dependencies at boot time.


**NOTE**: This cookbook depends on **version 1.29.0** of fog. If you are using a default *v14.1.0* RightScale ServerTemplate, then you must update your *RubyGems* repo in your ServerTemplate to at least *2015-04-23* so that this version of fog can be installed.

This cookbook has been verified to work with:
* Ubuntu 14.04
* CentOS 6.5

Recipes
-------

| Name              | Description                                |
|-------------------|--------------------------------------------|
| rsc_ros::default  | Download and install fog and dependencies. |
| rsc_ros::download | Download file from remote object store.    |


Inputs
------

attribute 'rsc_ros/storage_provider',
attribute 'rsc_ros/access_key',
attribute 'rsc_ros/secret_key',
attribute 'rsc_ros/bucket',
attribute 'rsc_ros/file',
attribute 'rsc_ros/destination',

e.g.
#### rsc_ros::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['rsc_ros']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### rsc_ros::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `rsc_ros` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rsc_ros]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
