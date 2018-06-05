# Reek 4 to Reek 5 migration

## Biggest changes

### No more regular expressions in Reeks configuration

In Reek 4 you could pass regular expressions to the `accept` or `reject` settings of
 
* [Uncommunicative Method Name](Uncommunicative-Method-Name.md)
* [Uncommunicative Module Name](Uncommunicative-Module-Name.md)
* [Uncommunicative Parameter Name](Uncommunicative-Parameter-Name.md)
* [Uncommunicative Variable Name](Uncommunicative-Variable-Name.md)

and to the `exclude` settings which are part of our [Basic Smell Options](docs/Basic-Smell-Options.md).
 
This means that this configuration was perfectly valid:

```yaml
UncommunicativeMethodName:
  accept:
    - !ruby/regexp /foobar/
UnusedPrivateMethod:
  exclude:
    - !ruby/regexp /i am(.*)unused/  
```

Support for this has been scrapped with Reek 5 to make the Reek configuration more yaml standard compliant.
You can still pass in regexes, you just have to wrap them into a string using a forward slash at the
beginning and at the end of the string like this:

```Yaml
---
UncommunicativeMethodName:
  accept:
    - "/^foobar$/"
UnusedPrivateMethod:
  exclude:
    - "/i am(.*)unused/"  
```

Everything within the forward slashes will be loaded as a regex.

### No more single item shortcuts for list items 

You cant use a configuration option that is supposed to be a list with a single element like this anymore:

```Yaml
---
UncommunicativeMethodName:
  accept: foobar
UnusedPrivateMethod:
  exclude: omg  
```

You'll have to use a proper list here like this:

```Yaml
---
UncommunicativeMethodName:
  accept: 
    - foobar
UnusedPrivateMethod:
  exclude:
    - omg  
```

### Move directory directives under a special key

In Reek 4 you could apply directory specific directives like this:

```Yaml
---
"web_app/app/controllers":
  NestedIterators:
    enabled: false
"web_app/app/helpers":
  UtilityFunction:
    enabled: false
```

which was nice and easy but also quite messy. With Reek 5 you'll have to scope this under a `directories`
key like this:

```Yaml
---
directories:
  "web_app/app/controllers":
    NestedIterators:
      enabled: false
  "web_app/app/helpers":
    UtilityFunction:
      enabled: false
```

### API changes

This is something that will only affect very advanced users. In case you have no idea what this might be about
you can just skip it or check out our [Developer API](docs/API.md).

#### Allow only detector names in configuration hash

In Reek 4 you could build your configuration like this:

```ruby
config_hash = { Reek::SmellDetectors::IrresponsibleModule => { 'enabled' => false } }
```

or like this:

```ruby
config_hash = { 'IrresponsibleModule' => { 'enabled' => false } }
```

Starting with Reek 5, the first way is not working anymore and the latter one is what you'll have to use.

#### Do not accept a class as parameter for reek_of

In the same vein as the change above you also can't use fully qualified detector names like this:

```Ruby
 reek_of(Reek::SmellDetectors::DuplicateMethodCall)
 ```
 
The only supported way now is either as symbol or string:
 
```Ruby
reek_of(:DuplicateMethodCall)
reek_of('DuplicateMethodCall')
```

## Smaller changes

* `PrimaDonnaMethod` has been given the better name `MissingSafeMethod`
* `wiki-links` flag has been renamed to `documentation` flag
* Reeks configuration file now assumes a "yml" extension at the end. You can still pass in any
name you want via our -c flag though
* We have dropped legacy code comment separator
* We have dropped Ruby 2.1 support

