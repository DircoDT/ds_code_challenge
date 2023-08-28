
![City Logo](./img/city_emblem.png)

# My solutions to the City of Cape Town's Data Science Unit Code Challenge

## Overview

This document serves as the starting point for navigating my solutions to the tasks.

The original readme containing the challenge instructions has been renamed to [`README_original.md`](README_original.md). (Last modified in August 2023.)

Data Visualisation Engineer applicants only have to complete **tasks 2 & 6**.

## 2. Initial Data Transformation

The solution was implemented using JupyterLab in a **Python 3.10** environment. (At the time of writing, not all the packages are available for Python 3.11 yet.)

There are some further Markdown-format explanations in the notebook itself.

* [transformation.ipynb](./transformation.ipynb)

Alternative output formats:

* [transformation.md](./transformation.md)
* [transformation.html](./transformation.html) *(includes interactive map)*

### Environment

Environment setup scripts are included for Windows:

1. [`activate.bat`](activate.bat)
   Creates and activates a Python virtual environment

2. [`requirements.bat`](requirements.bat)
   Installs pip and the required Python packages

3. [`jupyterlab.bat`](jupyterlab.bat)
   Opens the notebook in Jupyter Lab
   *Set notebook to Trusted to enable the final interactive visualisation.*

The notebook should work on other operating systems too, assuming the above setup scripts are modified accordingly.

### Data

All the relevant data files are included in the `data` folder to make sure it keeps working even if the original repo switches to different files in future.

*Note: Zipped files (`*.gz`) can be used as-is in Python. It is not necessary to make an unzipped copy.*

---

### 6. Data Visualisation Task

*In which suburbs should the Water and Sanitation directorate concentrate their infrastructure improvement efforts?*

#### Interactive Visualisation

> 1. A chart (plot) or charts (plots) that helps to answer the above question.
> 2. A minimalist cartographic map with identifiable landmark features (e.g. major roads, railways, etc.) and some representation of the data.
> 3. Make it interactive in some manner, so as to allow users to explore the data and uncover insights.

Source code:
* [https://github.com/DircoDT/DircoDT.github.io](https://github.com/DircoDT/DircoDT.github.io)

Live demo:
* [https://dircodt.github.io/](https://dircodt.github.io/)

#### Data Storytelling

> Provide a brief, step-by-step, point form description of how your visualisations (and information from the dataset) outline a data-driven story that answers the above question.

* [data-driven-storytelling.md](./data-driven-storytelling.md)

#### Design Principles

> Provide a brief, point form explanation for why you have chosen certain colours (e.g. for legends), fonts, the layout or anything else that will help us understand your thinking in designing the data visualisation / dashboard to answer the question.

* [visualisation-design-choices.md](./visualisation-design-choices.md)

---
