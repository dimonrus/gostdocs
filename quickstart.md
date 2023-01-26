# Quick start

At first, you need to clone [GOST](https://github.com/dimonrus/gost) repo from git into your work directory. 

Ensure you have installed [GOLANG](https://go.dev/dl/) before your start
## Clone GOST

```bash
git clone https://github.com/dimonrus/gost.git
```

Change your work directory by change directory command

```bash
cd gost
```
## Create your project

Make new project by following command

```bash
make project
```

Enter name of your new project and wait until all files will be copied into new project directory.
## Run application

Now you can go to the new project directory and run application

```bash
cd ../${NEW_PROJECT_NAME}; \
make project-build; \
./${NEW_PROJECT_NAME} -app=web
```
** command `make project-build` scans git repository for fulfill `-ldflags` flags. 
If you want always knows actual version of your code you can create git repo into you new project directory

For example, we created "tutorial" project, and now we can start it as web application
```bash
cd ../tutorial; \
make project-build; \
./tutorial -app=web
```

If `everything is ok` you will see something like this in console output:

?> tutorial 2023/01/22 13:31:46 main.go:62: Application environment ENV=local <br>
tutorial 2023/01/22 13:31:46 web.go:161: Start insecure web server at 0.0.0.0:8080

[STATE OF CODE #1](https://github.com/dimonrus/tutorial/commit/6857d6a77860ef40a7eec631f5cfcd960e66ce69)