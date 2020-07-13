# psalm/plugin-laravel `Undefined index: wrap` repro

## Reproducing

### With Docker

`docker build -t repro .`

### Without Docker

`./reproduce.sh`

## Report

### Triggering Code

```php
UserResource::$wrap = 'items';
```

### Expected Outcome

No error, `$wrap` exists on base `JsonResource`. Works without `psalm/plugin-laravel` enabled.

### Actual Outcome

```
Getting /app/app/Http/Controllers/UserController.php
Analyzing /app/app/Http/Controllers/UserController.php

   ErrorException 

  Undefined index: wrap

  at vendor/vimeo/psalm/src/Psalm/Internal/Analyzer/Statements/Expression/Fetch/StaticPropertyFetchAnalyzer.php:318
    314|             }
    315|         }
    316| 
    317|         $class_storage = $codebase->classlike_storage_provider->get($declaring_property_class);
  > 318|         $property = $class_storage->properties[$prop_name];
    319| 
    320|         if ($var_id) {
    321|             if ($property->type) {
    322|                 $context->vars_in_scope[$var_id] = \Psalm\Internal\Type\TypeExpander::expandUnion(
```
