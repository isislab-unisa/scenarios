All templates for the tasks are available in the `~/templates` folder.

To access the templates, run the following commands in the terminal:

```bash
cd templates
ls -l
```

You should see the list of folders, one per each topic:

```text
... 3-A-single-container-deployment
... 4-B-multi-container-deployment
... 5-C-namespace-isolated-deployment
... 6-D-resilient-application-deployment
... 7-E-internet-facing-application-deployment
```

To access the YAML files for each task, navigate to the corresponding folder and list its contents:

```bash
cd 3-A-single-container-deployment
ls -l
```

You should see a folder for each task, containing the YAML files for that task:

```text
... taskA.1
... taskA.2
... taskA.3
... taskA.4
... taskA.5
```

Access the YAML files for each task by navigating to the corresponding folder and listing its contents:

```bash
cd taskA.1
ls -l
```

You should see the YAML files for that task:

```text
... deployment.yaml
... service.yaml
```