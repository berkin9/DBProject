from django.db import models
from django.utils.text import slugify

class Course(models.Model):
    title = models.CharField(max_length=50)
    description = models.TextField()
    imageUrl = models.CharField(max_length=50, blank=False)
    date= models.DateField()
    isActive = models.BooleanField()
    slug = models.SlugField(default="",null=False,blank=True, unique=True, db_index=True)
    type = models.TextField(default="empty",null=False)

    TYPE_CHOICES = (
        ("programlama", "programlama"),
        ("web-gelistirme", "web-gelistirme"),
        ("mobil-gelistirme", "mobil-gelistirme"),
    )
    type = models.CharField(max_length = 20, choices = TYPE_CHOICES, default = 'empty', null=False,blank=False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super().save(args,kwargs)

    def __str__(self):
        return f"{self.title} {self.date}"


class Category(models.Model):
    name = models.CharField(max_length=40)
    slug = models.CharField(max_length=50)