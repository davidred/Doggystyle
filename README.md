#WaggingTails - a dating site for pets

A fun to use app allowing pet owners to find nearby playmates for their pets, as well as meet fellow pet lovers.

##Goals

1. Create OkCupid clone for pets and allow for profile creation, messaging, and filtered searches
2. Allow users to search by preference for playmate (breed, size, and what they're looking for)
3. Seed the database with a lot of cute dog pictures

##Todo

- Add realtime notifications for messages and profile visits
- Integrate Google Maps API to find nearby dog parks

##Requirements

The following external web services are used:

- [Amazon Web Services S3](http://aws.amazon.com/)
- [Facebook Omniauth](http://developers.facebook.com/)

Several authentication keys are expected as environment variables. You can create a **config\application.yml** file in your Rails **config/** folder with the following code:

```
development and default photos:
AWS_BUCKET: 'doggystyle-development'
```

```
production:
    AWS_BUCKET: 'doggystyle-production'
```

```
AWS_ACCESS_KEY_ID: "..."
```

```
AWS_SECRET_ACCESS_KEY: "..."
```

```
FACEBOOK_KEY: '...'
```

```
FACEBOOK_SECRET: '...'
```
