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
        inventory = storyManager.story.variablesState["inventory"] as InkList;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void AddItem(string item)
    {
        inventory.AddItem(item);
    }
}
