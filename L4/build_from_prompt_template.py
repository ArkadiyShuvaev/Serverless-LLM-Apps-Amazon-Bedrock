import boto3
import json
from jinja2 import Template
from pathlib import Path

def build_template():
    path = Path(__file__).with_name('prompt_template.txt')
    transcript = ""
    with path.open("r") as file:
        template_string = file.read()

        data = {
            'transcript': transcript,
            'topics': ['charges', 'location', 'availability']
        }

        template = Template(template_string)

    prompt = template.render(data)
    print(prompt)

build_template()
