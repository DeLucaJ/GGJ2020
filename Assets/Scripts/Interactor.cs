using UnityEngine;
using UnityEngine.UI;

public class Interactor : MonoBehaviour
{
    public float raydistance;
    public KeyCode interact_key;
    public Camera camera;
    public LayerMask layerMask;
    public StoryManager storyManager;
    public FirstPersonAIO controller;
    public Text interactMessage;

    private bool canInteract = true;
    private bool showingMessage = false;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        SelectActor();
    }

    public void FreezeMovement(bool value)
    {
        controller.enableCameraMovement = !value;
        controller.playerCanMove = !value;
        controller.FreeCursor(value);
        canInteract = !value;
    }

    void Teleport(Vector3 position, bool cantp)
    {
        if(cantp) transform.position = position;
    }

    void EnterConversation(Actor actor)
    {
        //Debug.Log(actor.character.name);
        storyManager.ShowUI(true);
        storyManager.LoadChunk(actor.character.sceneName);

        if (actor.character.voices.Count > 0)
        {
            int voice = Random.Range(1, actor.character.voices.Count);
            actor.audioSource.clip = actor.character.voices[voice];
            actor.audioSource.Play();
        }
    }

    void PickupItem(Pickup p)
    {
        if (p.isInventory)
        {
            storyManager.im.AddItem(p.storyVar);
        }
        else
        {
            storyManager.story.variablesState[p.storyVar] = (int)storyManager.story.variablesState[p.storyVar] + 1;
        }
        Debug.Log("Pickedup " + p.storyVar);
        Destroy(p.gameObject);
    }

    void SelectActor()
    {
        Ray selector = camera.ViewportPointToRay(Vector3.one / 2f);
        RaycastHit hit;
        if (canInteract && Physics.Raycast(selector, out hit, raydistance, layerMask))
        {
            Actor actor = hit.collider.GetComponent<Actor>();
            Teleporter tp = hit.collider.GetComponent<Teleporter>();
            Pickup pickup = hit.collider.GetComponent<Pickup>();
            
            if (!showingMessage && (actor != null || tp != null || pickup != null))
            {
                interactMessage.gameObject.SetActive(true);
                showingMessage = true;
                if (actor != null) 
                {
                    interactMessage.text = "Press E to Talk";
                }
                if (tp != null)
                {
                    interactMessage.text = "Press E to Enter";
                }
                if (pickup != null)
                {
                    interactMessage.text = "Press E to Pickup";
                }
            }

            if (actor != null && Input.GetKeyDown(interact_key))
            {
                EnterConversation(actor);
            }
            if (tp != null && Input.GetKeyDown(interact_key))
            {
                Teleport(tp.destination.position, tp.canTeleport);
            }
            if (pickup != null && Input.GetKeyDown(interact_key))
            {
                PickupItem(pickup);
            }
        }
        else
        {
            if (showingMessage) 
            {
                interactMessage.gameObject.SetActive(false);
                showingMessage = false;
            }
        }
    }
}
