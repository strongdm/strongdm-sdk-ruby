# Todo: types for class fields
# Todo: do doc comments come before or after attributes?
# Todo: return statements?
# Todo: imports?
# RequestMetadata 
class RequestMetadata

    @page 
end
# ResponseMetadata 
class ResponseMetadata

    @next_page 


    @found 


    @affected 
end

class NodeCreateRequest

    @metadata 


    @nodes 
end

class NodeCreateResponse

    @metadata 


    @nodes 


    @tokens 
end

class NodeGetRequest

    @metadata 


    @id 
end

class NodeGetResponse

    @metadata 


    @node 
end

class NodeUpdateRequest

    @metadata 


    @id 


    @node 
end

class NodeUpdateResponse

    @metadata 


    @node 
end

class NodeDeleteRequest

    @metadata 


    @id 
end

class NodeDeleteResponse

    @metadata 
end

class NodeListRequest

    @metadata 


    @filter 
end

class NodeListResponse

    @metadata 


    @nodes 
end

class NodeBatchUpdateRequest

    @metadata 


    @nodes 
end

class NodeBatchUpdateResponse

    @metadata 


    @nodes 
end

class NodeBatchDeleteRequest

    @metadata 


    @ids 
end

class NodeBatchDeleteResponse

    @metadata 
end
# Node is a domain object. 
class Node

    @relay 


    @gateway 
end

class Relay

=begin
id is the unique ID of a relay 
=end
    @id 


=begin
name is the human readable unique name for this relay. 
=end
    @name 
end

class Gateway

=begin
id is the unique ID of a gateway 
=end
    @id 


=begin
name is the human readable unique name for this relay. 
=end
    @name 


=begin
listen_address represents the network address to which nodes should dial to. 
=end
    @listen_address 


=begin
bind_address represents the local network address to which the gateway
 must try to bind itself. 
=end
    @bind_address 
end


class Nodes
    def initialize()
        # TODO: initialize something
    end
    
    
    def create(request)
        # TODO: implement this
        # Host: 
        # BasePath: 
        # Dial to /v1/nodes by POST
        # Body: *
        # ResponseBody: 
    end
    
    def get(request)
        # TODO: implement this
        # Host: 
        # BasePath: 
        # Dial to /v1/nodes/{id} by GET
        # Body: 
        # ResponseBody: 
    end
    
    def update(request)
        # TODO: implement this
        # Host: 
        # BasePath: 
        # Dial to /v1/nodes/{id} by PUT
        # Body: *
        # ResponseBody: 
    end
    
    def delete(request)
        # TODO: implement this
        # Host: 
        # BasePath: 
        # Dial to /v1/nodes/{id} by DELETE
        # Body: 
        # ResponseBody: 
    end
    
    def list(request)
        # TODO: implement this
        # Host: 
        # BasePath: 
        # Dial to /v1/nodes by GET
        # Body: 
        # ResponseBody: 
    end
    
    def batch_update(request)
        # TODO: implement this
        # Host: 
        # BasePath: 
        # Dial to /v1/nodes by PUT
        # Body: *
        # ResponseBody: 
    end
    
    def batch_delete(request)
        # TODO: implement this
        # Host: 
        # BasePath: 
        # Dial to /v1/nodes by DELETE
        # Body: 
        # ResponseBody: 
    end
    
end


