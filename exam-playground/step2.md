All templates for the tasks are available in the `~/templates` folder.

To access the templates, run the following commands in the terminal:

```bash
cd templates
ls -l
```

You should see the list of folders, one per each topic:

```text
... internet-facing-application-deployment
... multi-container-deployment
... namespace-isolated-deployment
... resilient-application-deployment
... single-container-deployment
```

To access the YAML files for each task, navigate to the corresponding folder and list its contents:

```bash
cd single-container-deployment
ls -l
```

You should see a folder for each task, containing the YAML files for that task:

```text
... task1
... task2
... task3
... task4
... task5
```

Access the YAML files for each task by navigating to the corresponding folder and listing its contents:

```bash
cd task1
ls -l
```

You should see the YAML files for that task:

```text
... deployment.yaml
... service.yaml
```