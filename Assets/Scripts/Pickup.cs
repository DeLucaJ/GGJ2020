using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pickup : MonoBehaviour
{
    public string storyVar;
    public Transform player;
    public bool facesPlayer = true;
    public bool isInventory = false;
    public StoryManager storyManager;

    // Update is called once per frame
    public void PickupItem()
    {
        if (isInventory)
        {
            storyManager.im.AddItem(storyVar);
        }
        else
        {
            storyManager.story.variablesState[storyVar] = (int)storyManager.story.variablesState[storyVar] + 1;
        }
        Debug.Log("Pickedup " + storyVar);
        Destroy(gameObject);
    }

    private void Update()
    {
        if (facesPlayer) FacePlayer();
    }

    void FacePlayer()
    {
        Vector3 lookPos = player.position - transform.position;
        lookPos.y = 0;
        Quaternion rotation = Quaternion.LookRotation(lookPos);
        transform.rotation = rotation; // Quaternion.Slerp(transform.rotation, rotation, Time.deltaTime);

        //transform.LookAt(playerTransform);
    }
}
