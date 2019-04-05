from setuptools import setup, find_packages


setup(
    name='conda_dnvgl_com',
    version='0.1.0',
    packages=find_packages(),
    install_requires=[
        'connexion[swagger-ui]',
    ]
)
