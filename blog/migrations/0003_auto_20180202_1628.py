# Generated by Django 2.0.1 on 2018-02-02 15:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_auto_20180202_1621'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='text_de',
            field=models.TextField(default=''),
        ),
        migrations.AlterField(
            model_name='post',
            name='text_en',
            field=models.TextField(default=''),
        ),
    ]
