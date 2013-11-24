

--[[
        Corona SDK Graphics 2.0 Mesh Test
        (c) 2013 S.K. Studios, LLC
        
--]]

--[]
display.setDefault( "minTextureFilter", "linear" )
display.setDefault( "magTextureFilter", "linear" )
--]]

local sd = require("screenDimensions")


local mesh = {}

local nodeTouched = nil


--]]



--[[
local node1 = display.newCircle(myImage.x, myImage.y,  10)
node1:setFillColor(0,77,120, 255)

node1.touch = function(self,event)
    
    
    
    if event.phase == "began" then
        
        if nodeTouch  then
            return true
        end
        
        nodeTouch = self
        node1.rememberX = self.x
        node1.rememberY = self.y
        
        node1.rememberPathX1 = myImage.path.x1
        node1.rememberPathY1 = myImage.path.y1
        
        
        node1.diffX = event.x - self.x
        node1.diffY = event.y - self.y
        
        print(myImage.path.x1,"rememberences")
    end
    
    if event.phase == "moved" then
        
        
        -- dont let the node go past screen boundaries for now
        if event.x < 0 or event.x > display.contentWidth then
            return true
        end
        
        if event.y < 0 or event.y > display.contentHeight then
            return true
        end
        
        node1.x= event.x - node1.diffX
        node1.y =event.y - node1.diffY
        myImage.path.x1 = node1.rememberPathX1 + node1.x - node1.rememberX 
        myImage.path.y1 = node1.rememberPathY1 + node1.y - node1.rememberY  
        
        node1.x = myImage.path.x1 + node1.rememberX - node1.rememberPathX1
        node1.y = myImage.path.y1 + node1.rememberY - node1.rememberPathY1
        
        
    end
    
    
    if event.phase == "ended" then
        node1.x = myImage.path.x1 + node1.rememberX- node1.rememberPathX1
        node1.y = myImage.path.y1 + node1.rememberY- node1.rememberPathY1
        node1.rememberPathX1 = myImage.path.x1
        node1.rememberPathY1   = myImage.path.y1
        nodeTouch = nil
    end
    
    return true
    
end

node1:addEventListener("touch", node1)





-----------------Node2
--
local node2 = display.newCircle(myImage.x , myImage.y + myImage.height * myImage.xScale,  10)
node2:setFillColor(0,77,120, 255)

node2.touch = function(self,event)
    
    if event.phase == "began" then
        
        if nodeTouched == nil then
            nodeTouched = self
        end
        
        if nodeTouched == self then
        else
            
            return true
        end
        
        
        node2.rememberX = self.x
        node2.rememberY = self.y
        
        node2.rememberPathX2 = myImage.path.x2
        node2.rememberPathY2 = myImage.path.y2
        
        
        node2.diffX = event.x - self.x
        node2.diffY = event.y - self.y
        
        print(myImage.path.x2,"rememberences")
    end
    
    if event.phase == "moved" then
        
        if nodeTouched ~= self then
            return true
        end
        
        -- dont let the node go past screen boundaries for now
        if event.x < 0 or event.x > display.contentWidth then
            return true
        end
        
        if event.y < 0 or event.y > display.contentHeight then
            return true
        end
        
        node2.x= event.x - node2.diffX
        node2.y =event.y - node2.diffY
        myImage.path.x2 = node2.rememberPathX2 + node2.x - node2.rememberX 
        myImage.path.y2 = node2.rememberPathY2 + node2.y - node2.rememberY  
        
        node2.x = myImage.path.x2 + node2.rememberX - node2.rememberPathX2
        node2.y = myImage.path.y2 + node2.rememberY - node2.rememberPathY2
        
        
    end
    
    
    if event.phase == "ended" then
        node2.x = myImage.path.x2 + node2.rememberX- node2.rememberPathX2
        node2.y = myImage.path.y2 + node2.rememberY- node2.rememberPathY2
        node2.rememberPathX2 = myImage.path.x2
        node2.rememberPathY2   = myImage.path.y2
        nodeTouched = nil
    end
    
    return true
end

node2:addEventListener("touch", node2)
--]]


-----------------Generic Node

local  createOneNode= function(myImage,myNodeNumber)
    
    
    -----------------NodeG
    
    local nodeG 
    
    if myNodeNumber == 1 then
        nodeG = display.newCircle(myImage.x - myImage.width /2, myImage.y - myImage.height/2,  10)
    elseif myNodeNumber ==2 then
        nodeG = display.newCircle(myImage.x - myImage.width /2, myImage.y  + myImage.height/2,  10)
    elseif myNodeNumber ==3 then
        nodeG = display.newCircle(myImage.x + myImage.width /2, myImage.y + myImage.height/2,  10)
        ---@livecode myImage.x = number
    elseif myNodeNumber ==4 then
        nodeG = display.newCircle(myImage.x + myImage.width/2, myImage.y- myImage.height/2,  10)
        
    end
    
    nodeG:setFillColor(0,77,120, 255)
    
    local myNode = {}
    if myNodeNumber == 1 then
        
        myNode.x = myImage.path.x1
        myNode.y = myImage.path.y1
        
    elseif myNodeNumber ==2 then
        myNode.x = myImage.path.x2
        myNode.y = myImage.path.y2
    elseif myNodeNumber ==3 then
        myNode.x = myImage.path.x3
        myNode.y = myImage.path.y3
    elseif myNodeNumber ==4 then
        myNode.x = myImage.path.x4
        myNode.y = myImage.path.y4
    end
    
    nodeG.touch = function(self,event)
        
        if event.phase == "began" then
            
            if nodeTouched == nil then
                nodeTouched = self
                display.currentStage:setFocus(nodeG)
            end
            
            if nodeTouched == self then
            else
                
                return true
            end
            nodeG.rememberX = self.x
            nodeG.rememberY = self.y
            
            nodeG.rememberPathX = myNode.x
            nodeG.rememberPathY = myNode.y
            
            
            nodeG.diffX = event.x - self.x
            nodeG.diffY = event.y - self.y
            
            print("Node: " .. myNodeNumber .. ": " .. myNode.x .. ", " .. myNode.y)
        end
        
        if event.phase == "moved" then
            
            if nodeTouched ~= self then
                return true
            end
            
            -- dont let the node go past screen boundaries for now
            if event.x < 0 or event.x > display.contentWidth then
                return true
            end
            
            if event.y < 0 or event.y > display.contentHeight then
                return true
            end
            
            nodeG.x= event.x - nodeG.diffX
            nodeG.y =event.y - nodeG.diffY
            myNode.x = nodeG.rememberPathX + nodeG.x - nodeG.rememberX 
            myNode.y = nodeG.rememberPathY + nodeG.y - nodeG.rememberY  
            
            if myNodeNumber == 1 then
                myImage.path.x1 =myNode.x 
                myImage.path.y1 =myNode.y 
            elseif myNodeNumber ==2 then
                myImage.path.x2 = myNode.x 
                myImage.path.y2 = myNode.y 
            elseif myNodeNumber ==3 then
                myImage.path.x3 = myNode.x 
                myImage.path.y3 = myNode.y 
            elseif myNodeNumber ==4 then
                myImage.path.x4 = myNode.x 
                myImage.path.y4 = myNode.y 
            end
            
            
            
            nodeG.x = myNode.x + nodeG.rememberX - nodeG.rememberPathX
            nodeG.y = myNode.y + nodeG.rememberY - nodeG.rememberPathY
            print("Path: " .. myNodeNumber .. ": " .. myNode.x .. ", " .. myNode.y)
            print("Node: " .. myNodeNumber .. ": " .. nodeG.x .. ", " .. nodeG.y)

            
        end
        
        
        if event.phase == "ended" then
            display.currentStage:setFocus(nil)
            
            
            nodeG.x = myNode.x + nodeG.rememberX- nodeG.rememberPathX
            nodeG.y = myNode.y + nodeG.rememberY- nodeG.rememberPathY
            
            if myNodeNumber == 1 then
                myImage.path.x1 =myNode.x 
                myImage.path.y1 =myNode.y 
            elseif myNodeNumber ==2 then
                myImage.path.x2 = myNode.x 
                myImage.path.y2 = myNode.y 
            elseif myNodeNumber ==3 then
                myImage.path.x3 = myNode.x 
                myImage.path.y3 = myNode.y 
            elseif myNodeNumber == 4 then
                myImage.path.x4 = myNode.x 
                myImage.path.y4 = myNode.y 
            end
            
            nodeG.rememberPathX = myImage.path.x2
            nodeG.rememberPathY   = myImage.path.y2
            nodeTouched = nil
        end
        
        return true
    end
    
    nodeG:addEventListener("touch", nodeG)
    
end

local function createNodes(myImage)
    createOneNode(myImage, 1)
    createOneNode(myImage, 2)
    createOneNode(myImage, 3)
    createOneNode(myImage, 4)
end

local myGroup  = display.newGroup()
myGroup.anchorX = 0
myGroup.anchorY = 0


--local myImage = display.newImage("CoronaGeek_side.png",0,0)
local myImage = display.newImage("coronaicon.png",0,0)


--myGroup:insert(myImage)
myImage.xScale = 1
myImage.yScale = 1

myImage.x =   sd.centerX
myImage.y =  sd.centerY

--[
myImage.path.x1 = 0
myImage.path.y1 = 0
myImage.anchorX = -1
myImage.anchorY = -1

-- need a function for splitting images
local function splitImage(myImage,xSplits,ySplits)
    
    local aspectRatio = display.pixelHeight / display.pixelWidth
    print("aspect ratio" .. aspectRatio)
    
    --grab region of screen , and hold as a temporary image
    local chunkWidth =  math.floor(myImage.width / xSplits)   
    local chunkHeight = math.floor(myImage.height / ySplits)
    
    
    
    
    print("chunk width:", chunkWidth,"chunk height:" , chunkHeight)
    print("xSplits:", xSplits, "ySplits", ySplits)
    
    print("adjusted width should be:", myImage.width * aspectRatio)  -- i have an 872 px image... how did i get that from 512
    print("adjusted height should be:", myImage.height * aspectRatio)
    
    
end

print("Base Image Width:", myImage.width, "Base height:",myImage.height)

splitImage(myImage, 2, 1)

createNodes(myImage)






local function captureWithDelay()
    
    local screenBounds =
    {
        xMin = -320,
        xMax = 320,
        yMin = 0,
        yMax = 480,
    }
    
    local myFirstCapture = display.capture(myImage)
    display.save(myFirstCapture,"test6.png", system.DocumentsDirectory)
    myFirstCapture:removeSelf()
    myFirstCapture = nil
end

timer.performWithDelay( 100, captureWithDelay )


--[[]
myImage.fill.effect = "composite.normalMapWith1DirLight"

myImage.fill.effect.dirLightColor = { 1, 1, 1, 1 }

local dirLightDirectionZ = -1.0

myImage.fill.effect.dirLightDirection = { 0,1,	dirLightDirectionZ }

myImage.fill.effect.ambientLightIntensity = 1

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if true then

	Runtime:addEventListener( "enterFrame", function( event )

		-- "t" will go 0..1..0.
		local t = ( 1.0 - ( ( math.cos( event.time / 1000 ) * 0.5 ) + 0.5 ) )

		if true then

			myImage.fill.effect.dirLightDirection = { math.cos( t * 2 * math.pi ),
														math.sin( t * 2 * math.pi ),
														dirLightDirectionZ }

		elseif false then

			myImage.fill.effect.dirLightColor = { ( 0.5 + ( 0.5 * t ) ), 1, ( 0.5 + ( 0.5 * t ) ), 1 }

		elseif false then

			myImage.fill.effect.dirLightDirection = { math.cos( 0 ),
														math.sin( 0 ),
														t }

		elseif false then

			myImage.fill.effect.ambientLightIntensity = t

		end

	end )

end
--]]