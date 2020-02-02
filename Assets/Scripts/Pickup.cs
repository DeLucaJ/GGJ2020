using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pickup : MonoBehaviour
{
    public string storyVar;
    public StoryManager storyManager;

    // Update is called once per frame
    public void PickupItem()
    {
        storyManager.story.variablesState[storyVar] = (int) storyManager.story.variablesState[storyVar] + 1;
        GameObject.Destroy(gameObject);
    }
}
