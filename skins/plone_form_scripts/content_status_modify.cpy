## Controller Python Script "content_status_modify"
##bind container=container
##bind context=context
##bind namespace=
##bind script=script
##bind subpath=traverse_subpath
##parameters=workflow_action, comment='', effective_date=None, expiration_date=None
##title=handles the workflow transitions of objects
##
state = context.portal_form_controller.getState(script, is_validator=0)
portal_workflow=context.portal_workflow
current_state=portal_workflow.getInfoFor(context, 'review_state')

if workflow_action!=current_state and not effective_date:
    effective_date=DateTime()

context.plone_utils.contentEdit( context
                               , effective_date=effective_date
                               , expiration_date=expiration_date )

if workflow_action!=current_state:
    context.portal_workflow.doActionFor( context
                                       , workflow_action
                                       , comment=comment )

return state.set(context=context, portal_status_message='Your contents status has been modified.')

