using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

public class InventoryManager : MonoBehaviour
{
    public StoryManager storyManager;

    private InkList inventory;

    // Start is called before the first frame update
    void Start()
    {
        inventory = new InkList("inventory", storyManager.story);
        Debug.Log(inventory.Count);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
