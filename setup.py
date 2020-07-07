#!/usr/bin/env python

import os
import re

from setuptools import setup, find_packages

long_description = open(
    os.path.join(
        os.path.dirname(__file__),
        'README.md'
    )
).read()

with open("kestrel/__init__.py", encoding="utf8") as file:
    version = re.search(r'__version__ = "(.*?)"', file.read()).group(1)

setup(
    name='kestrel',
    author='Mark V Senofsky',
    author_email='mark.v.senofsky@gmail.com',
    version=version,
    license='LICENSE',
    url='https://github.com/senofsky/kestrel',
    description='A tool for detecting trash in images and videos',
    long_description=long_description,
    long_description_content_type='text/markdown',
    packages=find_packages('.', exclude=['test']),
    install_requires=[],
    extras_require={
        'dev': [
            'black==19.10b0',
            'mypy==0.770',
            'pytest==5.4.3',
            'typing==3.7.4.1'
        ]
    }
)
