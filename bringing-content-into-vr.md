---
title: 'Bringing content into VR'
teaching: 10
exercises: 2
---


## Tutorial

For this tutorial, there is a variety of code
for you to experiment bringing content to multidimensional media 
via an API or an Image framework onto a VR application.

The objective is to experiment with these APIs, reading a JSON file
or retrieving multimedia and deploying it in your application,
either at loading time (at the beginning of your application), or at runtime.

### Unity
Below is a script code in Unity which allows you to bring together images
from an image URL, such as:

[https://6fzwqjk2sg.execute-api.eu-west-2.amazonaws.com/latest/iiif/2/Johannes_Vermeer_Het_melkmeisje/](https://6fzwqjk2sg.execute-api.eu-west-2.amazonaws.com/latest/iiif/2/Johannes_Vermeer_Het_melkmeisje/)

``` C#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;
using System.Threading.Tasks;
using System;


public class callAPI : MonoBehaviour
{
    public string apiURL="";

    // Start is called before the first frame update
    async void Start()
    {

        if (apiURL=="") {
            Debug.Log("Nothing to see...");
        }
        else{ 
            //Task<string> data = GetStringData();
            //Debug.Log(data);
            Texture texture = await GetTextureData();


        } 
    }

    public async Task<Texture> GetTextureData()
    {
        TaskCompletionSource<Texture> taskCompletionSource = new TaskCompletionSource<Texture>();
        StartCoroutine(GetTextureDatafromURL(taskCompletionSource));
        try
        {
            Texture receiveddata = await taskCompletionSource.Task;
         
            if (receiveddata!=null)
            { 
                return receiveddata;
            }
            else
            {
                return null;
            }
        }
        catch (Exception e)
        {
            Debug.LogError("Error fetching data: " + e.Message);
            return null;
        }
    }


    private IEnumerator GetTextureDatafromURL(TaskCompletionSource<Texture> tcs)
    {


         using (UnityWebRequest uwr = UnityWebRequestTexture.GetTexture(apiURL))
        {
            yield return uwr.SendWebRequest();

            if (uwr.result != UnityWebRequest.Result.Success)
            {
                Debug.Log(uwr.error);
            }
            else
            {
                // Get downloaded asset bundle
                var texture = DownloadHandlerTexture.GetContent(uwr);
                Renderer renderer = GetComponent<Renderer>();                
                renderer.material.mainTexture = texture; 
            }
        }
        
    }
  
    
    public async Task<string> GetStringData()
    {
        TaskCompletionSource<String> taskCompletionSource = new TaskCompletionSource<String>();
        StartCoroutine(GetTextDatafromURL(taskCompletionSource));

        try
        {
            string receiveddata = await taskCompletionSource.Task;

            if (!string.IsNullOrEmpty(receiveddata))
            { 
                Debug.Log("Received Data: " + receiveddata);
                return receiveddata;
            }
            else
            {
                Debug.LogWarning("No data received.");
                return "";
            }
        }
        catch (Exception e)
        {
            Debug.LogError("Error fetching data: " + e.Message);
            return null;
        }
    }
     private IEnumerator GetTextDatafromURL(TaskCompletionSource<string> tcs)
    {
        using (UnityWebRequest request = UnityWebRequest.Get(this.apiURL))
        {
            yield return request.SendWebRequest();

            if (request.result == UnityWebRequest.Result.ConnectionError
                || request.result == UnityWebRequest.Result.ProtocolError)
            {
                Debug.LogError("Error: " + request.error);
                tcs.SetResult(string.Empty); // Set the result to an error or an appropriate default value
            }
            else
            {
                string data = request.downloadHandler.text;
                tcs.SetResult(data); // Set the result to the API response data
            }
        }
    }
    // Update is called once per frame
    void Update()
    {
        
    }
}

```
