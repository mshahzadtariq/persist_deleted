Persist Deleted Records for Mongoid
===============
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

TO permanently delete record from system/database, call delete method

    object.delete
