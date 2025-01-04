# Generated by Django 4.2.16 on 2024-11-02 10:58

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Validator',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('public_key', models.TextField(unique=True)),
                ('active', models.BooleanField()),
                ('debug', models.BooleanField(default=False)),
            ],
        ),
    ]
