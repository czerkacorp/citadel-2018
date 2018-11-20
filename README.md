# Citadel

Citadel is a full-featured account management system for SWGEmu Core3 based Star Wars Galaxies servers built with Ruby on Rails. It's core module provides a secure web interface that allows quick and easy user self registration, account management and account administration. Add-on modules provide even more functionality, giving server administrators the ability to provide best-in-class service to their communities.

### **Citadel is currently pre-alpha and we do NOT recommend using it with a production server. All the necessary pre-requisites are specified in the gem file.**

### **You will also need a working SWGEmu development server to use along side Citadel. We recommend using [ZonamaDev](https://github.com/Zonama/ZonamaDev), which is the current easiest way to get up and running.**

## Initial Database Setup for Development

With Citadel, we prefer to create the database separately from SWGEmu. We've created a quick command to allow you to pull in the schemna from the SWGEmu gerrit repository.

First, ensure that you've set up a MySQL instance and added the connection information and user to the **database.yml** file.

```bash
rake citadel:dbsetup
```

## Contributing

If you would like to contribute to Citadel, please follow these steps.

- Fork the repository
- Make your changes and push to your fork
- Submit a pull request to the Citadel repository

## Other

If you have any feature requests, questions or concerns, please open an issue.
