# Generated by Django 2.0.1 on 2018-02-02 15:28

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_auto_20180202_1628'),
    ]

    operations = [
        migrations.RenameField(
            model_name='post',
            old_name='text_de',
            new_name='text_es',
        ),
    ]
