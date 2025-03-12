-- VALIDATING KEY

function ValidateKey(userKey)
    local Url = "https://revolt.kingluc.my.id/live/3-11"
    local body = {
        H = hwid, -- Provide a hardware ID that is unique to each use
        I = ServiceID, -- Provide your REVOLT Service ID
        K = userKey -- Key that is provided
    }

    local response = sendRequest(Url, body)

    if response and response.status then
        if response.status == "VALID_KEY" then
            print("[REV<>OLT] Key Valid! Access Granted")
            return true
        else
            print("[REV<>OLT] Invalid Key: " .. response.error)
            return false
        end
    else
        error("[REV<>OLT] Request failed or returned invalid response")
        return false
    end
end


-- GENERATING KEY URL

local function getServiceURL()
    local response = sendRequest("https://revolt.kingluc.my.id/live/7-12", {
        I = genv.ServiceID,
        H = hwid
    })


    if response and response.link then
        return response.link
    elseif response and response.error then
        error("[REV<>OLT] " .. response.error)
    end
    
    return nil
end
