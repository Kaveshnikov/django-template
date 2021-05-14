from django.db import models


class Parent(models.Model):
    text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')


class Child(models.Model):
    parent = models.ForeignKey(Parent, on_delete=models.CASCADE)
    text = models.CharField(max_length=200)
    counter = models.IntegerField(default=0)
