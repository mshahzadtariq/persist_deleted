Persist Deleted Records for Mongoid
===============
Soft delete functionality for Mongoid ORM so you may recover records at later stage.
Installation
=======
Add following line to your Gemfile

    gem 'persist_deleted', git: 'https://github.com/mshahzadtariq/persist_deleted'

And include this module to the model for which you want to enable soft delete and recovery feature

    class MyModel
      include Mongoid::Document
      include Mongoid::PersistDeleted
      
      ......
      
    end
    
and that is all. 

Usage
=======

Persist sensitive data with options to recover data.
    
To persist record, call destroy method on object. It will not delete record from database but persist that so you can recover it in the future if required. 
    
    object.destroy
    
It also has two scopes

only_deleted: Fetch only deleted records of that particular model
e.g

    Model.only_deleted
    
with_deleted: Fetch all records of that particular model including deleted records
e.g

    Model.with_deleted
    

To recover records, call recover method on object

    Model.only_deleted.first.recover

To permanently delete record from system/database, call delete method

    object.delete
